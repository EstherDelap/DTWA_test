using DTWA
using JLD2

function main()
    #commit_id = readchomp(`git rev-parse HEAD`)
    dim = (5,4,2)
    N = 10000
    number_repeats = 10000
    Γ_deph = 0.2
    Γ_decay = 0
    Ω = 5
    α = 0

    outfile = "Results_3.jld2"
    rv1, rv2= DTWA.repeated_euler(dim, N,number_repeats,Γ_deph, Γ_decay,Ω, α, "Ising")
    jldsave(outfile; collective_spin = rv1, average = rv2)
end

main()