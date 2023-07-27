using DTWA
using JLD2


function main(dim, N, number_repeats, Γ_deph, Γ_decay, Ω, α, method, axis, dir)

    outfile = "results.jld2"
    rv1, rv2= DTWA.repeated_euler(dim, N,number_repeats,Γ_deph, Γ_decay,Ω, α, method, axis, dir)
    jldsave(outfile; α=α, Γ_deph=Γ_deph, Γ_decay=Γ_decay, Ω = Ω, axis = axis, dir = dir, collective_spin = rv1, average = rv2)
end

main([parse(Int64,ARGS[1]),parse(Int64,ARGS[2]),parse(Int64,ARGS[3])],parse(Int64,ARGS[4]),parse(Int64,ARGS[5]), parse(Float64,ARGS[6]), parse(Float64,ARGS[7]), parse(Float64,ARGS[8]), [parse(Float64,ARGS[9]), parse(Float64,ARGS[10]),parse(Float64,ARGS[11])], ARGS[12], parse(Int64,ARGS[13]), parse(Int64,ARGS[14]))