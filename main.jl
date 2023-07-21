using DTWA
using JLD2
using Distributed

@everywhere begin
    using Pkg
    Pkg.activate(ARGS[1])
    Pkg.instantiate()
    Pkg.precompile()
end

@everywhere using DTWA

function main()
    #commit_id = readchomp(`git rev-parse HEAD`)
    dim = (4,4,4)
    N = (1000)
    number_repeats = 1000
    Γ_deph = 0
    Γ_decay = 0.0025
    Ω = 0
    α = 6

    Jx = DTWA.Jx_Ising(dim)
	Jy = DTWA,Jx_Ising(dim)
	Jz = DTWA,Jz_Ising(dim,α)

    number_spins = dim[1]*dim[2]*dim[3]
    J_bar = sum(Jz.data)/number_spins
    time_interval = (0.0, 10.0/J_bar)

    outfile = "results.jld2"
    traj = [1:number_repeats]
    rv = pmap(_->DTWA.euler_3D(N, time_interval, DTWA.spin_array_3D(dim, 1, 1), Γ_deph, Γ_decay, Ω, Jx, Jy, Jz),traj)
    jldsave(outfile; collective_spin = rv, nprocs = nprocs())
end

main()