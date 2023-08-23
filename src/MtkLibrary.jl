module MtkLibrary

using Revise
using ModelingToolkit
using ModelingToolkitStandardLibrary.Blocks: SecondOrder, FirstOrder

include("mechanical/mechanical.jl")
include("electromechanical/electromechanical.jl")
include("electrical/electrical.jl")

end
