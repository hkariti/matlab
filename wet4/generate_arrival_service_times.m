function [ arrival_times , service_times ] = generate_arrival_service_times( lambda , mu )

vector_entry = @(p) -1./p * log(1-rand());
num_requests = 10;
time_diffs = vector_entry(linspace(lambda, lambda, num_requests));
arrival_times = transpose(cumsum(time_diffs));
service_times = transpose(vector_entry(linspace(mu, mu, num_requests)));

end

