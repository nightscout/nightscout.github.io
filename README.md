# Nightscout Documentation

This is the repo that contains the source files for the [Nightscout Docs](https://nightscout.github.io/) site.

Documentation was migrated from MkDocs to [Sphinx](https://www.sphinx-doc.org/en/master/index.html) with [MyST](https://myst-parser.readthedocs.io/en/latest/index.html).

[Markdown](https://daringfireball.net/projects/markdown/basics) is a simple text-to-HTML conversion tool for web writers. Markdown allows you to write using an easy-to-read, easy-to-write plain text format.

## Contributing

To suggest changes, fork this repository, edit the files, and submit your changes as a pull request.

If you don't want to install the full documentation suite, you can simply propose edits on the documentation site.

The developer discussion of Nightscout happens on our Discord channel at https://discord.gg/zg7CvCQ

### Previewing Changes

Sphinx requires [Python 3.8+](https://www.sphinx-doc.org/en/master/usage/installation.html).

* Install python modules

```bash
$ cd <nightscout docs location - i.e. where you cloned it>
$ pip install -r requirements.txt
```

* Compile the documentation

```bash
$ cd <nightscout docs location>
$ sphinx-build -b dirhtml docs _build
```

* Start a local http server to view the documentation

```bash
$ cd <nightscout docs location>/_build/dirhtml
$ python -m http.server
```

* You can now browse the documentation locally at  [http://localhost:8000/](http://localhost:8000/) 



* Optionally, you can share the preview with others by building them in your repository with GitHub pages. You need to enable GitHub pages in your repository fork. The workflow in `.github/workflows/documentation.yaml` will automatically create and deploy your pages. 

<img src="docs/vendors/github/img/GHPages.png" width="400px" />

## Conventions

* Use images for clarity whenever appropriate

### Admonitions
[Admonitions](https://myst-parser.readthedocs.io/en/latest/syntax/admonitions.html) are a markdown extension that enable formatted blocks for visually calling out information. 
