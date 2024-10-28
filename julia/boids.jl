module Boids
using Plots

mutable struct WorldState
    boids::Vector{Tuple{Float64, Float64}}
    velocities:: Vector{Tuple{Float64, Float64}}
    height::Float64
    width::Float64
    function WorldState(n_boids, h, w)
        boids = [(rand(0:w), rand(0:h)) for _ in 1:n_boids]
        speed = 2
        velocities = [(rand(-1.0:0.1:1.0)*speed, rand(-1.0:0.1:1.0))] 
        new(boids, velocities, h, w)
    end
end

function update!(state::WorldState)
    max_radius = 20
    min_radius = 5
    for i in 1:lenght(state.boids)
        boid = state.boids[i]
        velocitiy = state.velocities[i]
    end
    # TODO:     реализация алгоритма
    return nothing
end

function (@main)(ARGS)
    h = 30
    w = 30
    n_boids = 10

    state = WorldState(n_boids, h, w)

    anim = @animate for time = 1:100
        update!(state)
        boids = state.boids
        scatter(boids, xlim = (0, state.width), ylim = (0, state.height))
    end
    gif(anim, "boids.gif", fps = 10)
end

end

using .Boids
Boids.main("")
