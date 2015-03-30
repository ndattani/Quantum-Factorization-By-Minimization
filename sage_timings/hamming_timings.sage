import re

##########################Change these if using on new computer########################

INPUT_FILE_DIRECTORY = "/Users/emileokada/Documents/Quantum Computing/Primes generated/"
OUTPUT_DIRECTORY = '/Users/emileokada/Documents/Quantum Computing/Timings/'

#######################################################################################

def extract(str):
	return re.search(r'(\s)(\d+\.\d+) user', str).groups()[1]

def take_time(semiprime):
	(factors, cpu_time) = qsieve(semiprime,time=True)
	return extract(cpu_time)

def import_data(file_name):
	input_file=open(file_name,'r')
	data= [eval(x.replace('\n','')) for x in input_file.readlines() if x.replace('\n','') is not '']
	input_file.close()
	return data

def run_factorizations(N):
	input_file_name = INPUT_FILE_DIRECTORY+"hamming_primes_"+str(N)+"x"+str(N)+".txt"
	output_file_name = OUTPUT_DIRECTORY+"timings_"+str(N)+"x"+str(N)+".txt"

	semi_primes = import_data(input_file_name)

	output_file=open(output_file_name,'w')
	
	for (semiprime,hamming_distance,p,q) in semi_primes:
		output_file.write('('+take_time(semiprime)+','+str(hamming_distance)+','+str(p)+','+str(q)+')'+'\n')
	
	output_file.close()


#Run script:

for N in range(70,520,10):
	run_factorizations(N)