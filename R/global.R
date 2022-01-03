
# Import font for package if not already istalled
if (! "Nanum Gothic" %in% sysfonts::font_families_google()) {
    sysfonts::font_add_google("Nanum Gothic", "Nanum Gothic")
}

#default to showtext
showtext::showtext_auto()
