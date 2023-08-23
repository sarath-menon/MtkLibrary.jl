using MtkLibrary
using Documenter

DocMeta.setdocmeta!(MtkLibrary, :DocTestSetup, :(using MtkLibrary); recursive=true)

makedocs(;
    modules=[MtkLibrary],
    authors="Sarath Suresh",
    repo="https://github.com/sarath-menon/MtkLibrary.jl/blob/{commit}{path}#{line}",
    sitename="MtkLibrary.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://sarath-menon.github.io/MtkLibrary.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/sarath-menon/MtkLibrary.jl",
    devbranch="main",
)
