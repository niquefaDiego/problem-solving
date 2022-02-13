#include <vector>
#include <string>
#include <iostream>
#include <sstream>

std::vector<std::string> vec_splitter(std::string s) {
	s += ',';
	std::vector<std::string> res;
	while(!s.empty()) {
		res.push_back(s.substr(0, s.find(',')));
		s = s.substr(s.find(',') + 1);
	}
	return res;
}

void debug_out(
	std::vector<std::string> __attribute__ ((unused)) args,
	__attribute__ ((unused)) int idx, 
	__attribute__ ((unused)) int LINE_NUM
) {
	std::cerr << std::endl;
} 

template <typename Head, typename... Tail>
void debug_out(
	std::vector<std::string> args,
	int idx,
	int LINE_NUM,
	Head H,
	Tail... T
) {
	if(idx > 0) std::cerr << ", ";
	else std::cerr << "Line(" << LINE_NUM << ") ";
	std::stringstream ss; ss << H;
	std::cerr << args[idx] << " = " << ss.str();
	debug_out(args, idx + 1, LINE_NUM, T...);
}

#define debug(...) debug_out(vec_splitter(#__VA_ARGS__), 0, __LINE__, __VA_ARGS__)
