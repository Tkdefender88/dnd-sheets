sources = files(
    'main.vala',
    'App.vala',
    'Widgets/Window.vala'
)

dependencies = [
    dependency('gtk+-3.0'),
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
]

executable(
    'dnd-sheets',
    sources,
    dependencies: dependencies,
    install: true
)