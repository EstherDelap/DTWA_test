using DTWA
using JLD2

function main()
    dim = (4,4,4)
    N = (1000)
    number_repeats = 1000
    Γ_deph = 0
    Γ_decay = 0.0025
    α = 6
    outfile = "results.jld2"
    rv = DTWA.repeated_euler(dim, N,number_repeats,Γ_deph, Γ_decay,Ω, α, "Ising")
    jldsave(outfile; collective_spin = rv)
end

main()