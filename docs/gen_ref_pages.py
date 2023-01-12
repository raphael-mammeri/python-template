"""Generate the code reference pages."""

from pathlib import Path

import mkdocs_gen_files

nav = mkdocs_gen_files.Nav()

for path in sorted(Path("../my_package").rglob("*.py")):  #
    if path.name not in ["__init__.py", "settings.py"]:
        module_path = path.relative_to("../my_package").with_suffix("")  #
        doc_path = path.relative_to("../my_package").with_suffix(".md")  #
        full_doc_path = Path("reference", doc_path)  #

        # parts = list(module_path.parts)
        parts = ["my_package"]
        parts.extend(list(module_path.parts))

        nav[parts] = doc_path.as_posix()

        with mkdocs_gen_files.open(full_doc_path, "w") as fd:  #
            identifier = ".".join(parts)  #
            print("::: " + identifier, file=fd)  #

        mkdocs_gen_files.set_edit_path(full_doc_path, path)  #

with mkdocs_gen_files.open("reference/SUMMARY.md", "w") as nav_file:  #
    nav_file.writelines(nav.build_literate_nav())
