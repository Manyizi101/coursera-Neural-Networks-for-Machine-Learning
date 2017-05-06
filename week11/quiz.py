def generate_list(results, current):
	if len(current) == 5:
		results.append(current)
	else:
		copy = current[:]
		generate_list(results, copy+[0])
		generate_list(results, copy+[1])

def energy(state):
	return [-state[0]*state[2]-state[1]*state[2]+2*state[0]*state[3]+3*state[3]*state[4]-2*state[2]*state[3]-2*state[2]*state[4]-3*state[3]*state[4], state]

l = []
generate_list(l, [])
energies = list(map(energy, l))
energies.sort()
print(energies)
