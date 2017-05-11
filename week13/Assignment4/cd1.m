function ret = cd1(rbm_w, visible_data)
% <rbm_w> is a matrix of size <number of hidden units> by <number of visible units>
% <visible_data> is a (possibly but not necessarily binary) matrix of size <number of visible units> by <number of data cases>
% The returned value is the gradient approximation produced by CD-1. It's of the same shape as <rbm_w>.
    visible_norm = sample_bernoulli(visible_data);
    % Sample hidden units based on data for positive phase
    hidden_data_probability = visible_state_to_hidden_probabilities(rbm_w, visible_norm);
    hidden_data = sample_bernoulli(hidden_data_probability);
    % Sample reconstruction units based on hidden for negative phase
    visible_reconstruction_probability = hidden_state_to_visible_probabilities(rbm_w, hidden_data);
    reconstruction = sample_bernoulli(visible_reconstruction_probability);
    % Sample hidden units based on reconstruction for negative phase
    hidden_reconstruction_probability = visible_state_to_hidden_probabilities(rbm_w, reconstruction);
    % hidden_reconstruction = sample_bernoulli(hidden_reconstruction_probability);
    ret = configuration_goodness_gradient(visible_norm, hidden_data) - configuration_goodness_gradient(reconstruction, hidden_reconstruction_probability);
end
