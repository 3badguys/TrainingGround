#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

struct ret_entry
{
    int product;
    int factor_a, factor_b;

    bool operator < (const ret_entry & cmp_entry) const
    {
        return product < cmp_entry.product;
    }
};

const unsigned long long MAXN = 10000000;
const int MAXPRIME = 5000000;
static bool is_prime_map[MAXPRIME];
static vector<int> prime_set;
static vector<struct ret_entry> result_set;

int main(void)
{
    is_prime_map[0] = 1;
    is_prime_map[1] = 1;

    for (int i = 2; i < MAXPRIME; ++i)
    {
        if (is_prime_map[i]) continue;

        prime_set.push_back(i);
        
        for (int j = i * 2; j < MAXPRIME; j += i) is_prime_map[j] = true;
    }

    struct ret_entry ret_vec;
    unsigned long long tmp_product;
    int prime_count = prime_set.size();
    for (int i = 0; i < prime_count; ++i)
    {
        for (int j = i + 1; j < prime_count ; ++j)
        {
            tmp_product = static_cast<unsigned long long>(prime_set[i]) * prime_set[j];
            if (tmp_product < MAXN)
            {
                ret_vec.product = tmp_product;
                ret_vec.factor_a = prime_set[i];
                ret_vec.factor_b = prime_set[j];
                result_set.push_back(ret_vec);
            }
            else
                break;
        }
    }
    
    sort(result_set.begin(), result_set.end());

    int result_len = result_set.size();
    for (int i = 0; i < result_len; ++i)
        cout << result_set[i].product << "=" << result_set[i].factor_a << "*" << result_set[i].factor_b << endl;
    
    return 0;
}
