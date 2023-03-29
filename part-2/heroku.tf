resource "heroku_app" "staging" {
  name   = "${var.app_name}-test"
  region = var.app_region
  buildpacks = [
    "heroku/nodejs",
    "heroku/php",
  ]
  config_vars = {
    AWS_ACCESS_KEY_ID     = ""
    AWS_SECRET_ACCESS_KEY = ""
    DB_URL                = ""
    WP_HOME               = ""
    WP_POST_REVISIONS     = 5
    WP_SITEURL            = ""
  }
}

# Create redis add-on and configure the app to use it
resource "heroku_addon" "redis-staging" {
  app  = heroku_app.staging.name
  plan = "heroku-redis:mini"
  config = {
    maxmemory_policy = "allkeys-lru"
  }
}

# Create papertrail add-on and configure the app to use it
resource "heroku_addon" "papertrail-staging" {
  app  = heroku_app.staging.name
  plan = "papertrail:choklad"
}
