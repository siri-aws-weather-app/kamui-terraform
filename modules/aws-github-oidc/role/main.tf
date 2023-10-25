
resource "aws_iam_role" "this" {
  name                 = var.role_name
  description          = var.role_description
  max_session_duration = var.max_session_duration
  assume_role_policy   = join("", data.aws_iam_policy_document.this.*.json)
  tags                 = var.tags
  # path                  = var.iam_role_path
  # permissions_boundary  = var.iam_role_permissions_boundary
}

resource "aws_iam_role_policy_attachment" "attach" {
  count = var.create_oidc_role ? length(var.oidc_role_attach_policies) : 0

  policy_arn = var.oidc_role_attach_policies[count.index]
  role       = join("", aws_iam_role.this.*.name)

  depends_on = [aws_iam_role.this]
}

data "aws_iam_policy_document" "this" {

  dynamic "statement" {
    for_each = [var.oidc_provider_arn]

    content {
      actions = ["sts:AssumeRoleWithWebIdentity"]
      effect  = "Allow"

      condition {
        test = "StringLike"
        values = [
          for repo in var.repositories :
          "repo:%{if length(regexall(":+", repo)) > 0}${repo}%{else}${repo}:*%{endif}"
        ]
        variable = "token.actions.githubusercontent.com:sub"
      }

      principals {
        identifiers = [statement.value]
        type        = "Federated"
      }
    }
  }
}