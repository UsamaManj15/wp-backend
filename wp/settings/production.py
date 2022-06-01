from .base import *  # noqa: F403

# TODO: Update before production release.
INTERNAL_IPS = []
ALLOWED_HOSTS = []
CORS_ALLOWED_ORIGINS = []

CACHES = {
    "default": {
        "BACKEND": "django_redis.cache.RedisCache",
        "LOCATION": environ["REDIS_URL"],  # noqa: F405
        "OPTIONS": {
            "CLIENT_CLASS": "django_redis.client.DefaultClient",
        },
    },
}

LOGGING = {
    "version": 1,
    "disable_existing_loggers": False,
    "filters": {"require_debug_false": {"()": "django.utils.log.RequireDebugFalse"}},
    "formatters": {
        "verbose": {"format": "%(levelname)s %(asctime)s %(module)s " "%(process)d %(thread)d %(message)s"},
    },
    "handlers": {
        "console": {
            "level": "DEBUG",
            "class": "logging.StreamHandler",
            "formatter": "verbose",
        },
    },
    "loggers": {
        "django.request": {
            "handlers": ["console"],
            "level": "ERROR",
            "propagate": True,
        },
        "django.security.DisallowedHost": {
            "level": "ERROR",
            "handlers": [
                "console",
            ],
            "propagate": True,
        },
    },
}
