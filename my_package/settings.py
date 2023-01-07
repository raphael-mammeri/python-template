import pathlib

import pydantic


class Settings(pydantic.BaseSettings):

    class Config:
        # .env variables must have following prefix
        env_prefix = "MY_PACKAGE_"
        env_file = pathlib.Path(__file__).parent / ".env"

    path_workdir: pathlib.Path = pathlib.Path(__file__).parent.parent
    path_docs: pathlib.Path = path_workdir / "docs"
