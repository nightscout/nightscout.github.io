# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'Nightscout Documentation'
copyright = '2023, #WeAreNotWaiting'
author = 'Patrick Sonnerat'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
   "myst_parser",
   "sphinx_design",
   "sphinx_rtd_theme",
#   "sphinx-copybutton",
   "notfound.extension",
]

myst_enable_extensions = [
    "colon_fence",
    "html_admonition",
    "html_image",
]

myst_heading_anchors = 6

source_suffix = ['.rst', '.md']

templates_path = ['_templates']
exclude_patterns = []

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'sphinx_rtd_theme'
html_theme_options = {
    'prev_next_buttons_location': None
}

html_static_path = ['_static']
html_logo =  'we are not waiting vertical.png'
html_favicon = 'NS-logo.png'
html_css_files = [
    'css/custom.css',
]
