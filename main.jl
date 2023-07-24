using DTWA
using JLD2

function main()
    #commit_id = readchomp(`git rev-parse HEAD`)
    dim = (4,4,4)
    N = (1)
    number_repeats = 10
    Γ_deph = 0
    Γ_decay = 0.0025
    Ω = 0 
    α = 6

    outfile = "results_2.jld2"
    rv = DTWA.repeated_euler(dim, N,number_repeats,Γ_deph, Γ_decay,Ω, α, "Ising")
    jldsave(outfile; collective_spin = rv)
end

main()