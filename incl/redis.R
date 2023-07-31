# The example assumes that a Redis server is running on the local host
# and standard port.
if (redux::redis_available()) {

# Register the redis plan on a specified task queue:
plan(redis)

# Start some local R worker processes:
startLocalWorkers(n = 2, linger = 1.0)

# A function that returns a future, note that N uses lexical scoping...
f <- \() future({4 * sum((runif(N) ^ 2 + runif(N) ^ 2) < 1) / N}, seed = TRUE)

# Run a simple sampling approximation of pi in parallel using  M * N points:
N <- 1e6  # samples per worker
M <- 10   # iterations
pi_est <- Reduce(sum, Map(value, replicate(M, f()))) / M
print(pi_est)

# Clean up
removeQ()

} # if (redux::redis_available())
