# this file tells pip and python about the package

from typing import Dict, List

import pathlib

import setuptools

# author = Mohammed Rafik Mammeri
# licence = MIT
# licence_file = LICENSE
# platforms = unix, linux, osx, cygwin, win32
# version = 0.0.1


if __name__ == "__main__":
    project_name = "python_template"
    project_description = "A python package template."
    package_name = "python_template"
    requirements_path = pathlib.Path(__file__).parent / "requirements"

    extras_requires: Dict[str, List[str]] = {}
    all_requirements = []  # except prod

    for file in requirements_path.iterdir():
        requirements_list = file.read_text().splitlines()
        if file.name == "prod":
            install_requires = requirements_list
        elif file.name.startswith('extra-'):
            extra_name = file.name[6:]
            extras_requires[extra_name] = requirements_list
            all_requirements.extend(requirements_list)
        else:
            all_requirements.extend(requirements_list)

    extras_requires["dev"] = all_requirements

    setuptools.setup(
        name=project_name,
        description=project_description,
        python_requires=">=3.9",
        packages=setuptools.find_packages(exclude=["tests"]),
        url="https://medmammeri.github.io/python-template/",
        author= "Mohamed Rafik Mammeri",
        install_requires=install_requires,
        setup_requires=["setuptools_scm"],
        extras_require=extras_requires,
        # define the app inside __main__ as the entrypoint for project
        entry_points={
            "console_scripts": (f"{project_name}={package_name}.__main__:app",),
        },
        license="MIT license",
        include_package_data=True,
        zip_safe=False,
    )
