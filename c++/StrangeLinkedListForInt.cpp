#include <iostream>
#include <cstdio>

using namespace std;

#define MAX_NODE_COUNT 300

struct node
{
    int value;
    int pre, next;
};

class StrangeLinkedListForInt {
private:
    static const int node_count = MAX_NODE_COUNT;
    struct node linkedList[node_count];
    int head;
    int valid;

public:
    class iterator {
        private:
            struct node * listAddr;
            int listIndex;

        public:
            iterator(struct node * addr, int index): listAddr(addr), listIndex(index) {}
            iterator(const iterator & copy_it)
            {
                listAddr = copy_it.listAddr;
                listIndex = copy_it.listIndex;
            }
            iterator& operator++()
            {
                listIndex = listAddr[listIndex].next;
                return *this;
            }
            iterator& operator--()
            {
                listIndex = listAddr[listIndex].pre;
                return *this;
            }
            iterator operator++(int)
            {
                iterator tmp(listAddr, listIndex);
                listIndex = listAddr[listIndex].next;
                return tmp;
            }
            iterator operator--(int)
            {
                iterator tmp(listAddr, listIndex);
                listIndex = listAddr[listIndex].pre;
                return tmp;
            }
            bool operator==(const iterator & other)
            {
                return listIndex == other.listIndex;
            }
            bool operator!=(const iterator & other)
            {
                return listIndex != other.listIndex;
            }
            struct node & operator*()
            {
                return listAddr[listIndex];
            }
            int index()
            {
                return listIndex;
            }
    };

public:
    // The following functions must be implemented.
    StrangeLinkedListForInt();
    void insert_back(int elem);
    void insert_front(int elem);
    void insert_after(int elem, iterator it);
    void remove_front();
    void remove_back();
    void remove(iterator it);
    int get_value(iterator it);
    iterator get_next(iterator it);
    iterator get_previous(iterator it);
    iterator begin();
    iterator end();

private:
    bool is_empty();
    bool is_full();
};

StrangeLinkedListForInt::StrangeLinkedListForInt()
{
    head = -1;
    valid = 0;

    for (int i = 0; i < node_count; ++i)
    {
        linkedList[i].value = -1;
        linkedList[i].pre = i - 1;
        linkedList[i].next = i + 1;
    }
    linkedList[0].pre = node_count - 1;
    linkedList[node_count - 1].next = 0;
}

void StrangeLinkedListForInt::insert_back(int elem)
{
    if (is_empty())
    {
        linkedList[0].value = elem;
        linkedList[0].pre = 0;
        linkedList[0].next = 0;
        head = 0;
        valid = 1;
        linkedList[node_count - 1].next = 1;
        linkedList[valid].pre = node_count - 1;
        return ;
    }
    iterator end_it = end();
    insert_after(elem, end_it);
}

void StrangeLinkedListForInt::insert_front(int elem)
{
    int new_head = valid;
    if (is_empty())
    {
        linkedList[0].value = elem;
        linkedList[0].pre = 0;
        linkedList[0].next = 0;
        head = 0;
        valid = 1;
        linkedList[node_count - 1].next = 1;
        linkedList[valid].pre = node_count - 1;
        return ;
    }
    iterator end_it = end();
    insert_after(elem, end_it);
    
    if (new_head != -1)
        head = new_head;
}

void StrangeLinkedListForInt::insert_after(int elem, iterator it)
{
    if (is_full())
        return ;

    int next_valid = linkedList[valid].next;
    struct node & cur_node = *it;
    struct node & next_node = linkedList[cur_node.next];
    linkedList[next_valid].pre = linkedList[valid].pre;
    linkedList[linkedList[valid].pre].next = next_valid;
    linkedList[valid].value = elem;
    linkedList[valid].pre = it.index();
    linkedList[valid].next = cur_node.next;
    cur_node.next = valid;
    next_node.pre = valid;

    if (valid == next_valid)
        valid = -1;
    else
        valid = next_valid;
}

void StrangeLinkedListForInt::remove_front()
{
    iterator head_it = begin();
    remove(head_it);
}

void StrangeLinkedListForInt::remove_back()
{
    iterator end_it = end();
    remove(end_it);
}

void StrangeLinkedListForInt::remove(iterator it)
{
    if (is_empty())
        return ;

    struct node & cur_node = *it;
    struct node & pre_node = linkedList[cur_node.pre];
    struct node & next_node = linkedList[cur_node.next];
    int cur_index = it.index();
    int pre_index = cur_node.pre;
    int next_index = cur_node.next;

    iterator head_it = begin();
    if (it == head_it)
        head = linkedList[head].next;

    pre_node.next = next_index;
    next_node.pre = pre_index;

    cur_node.value = -1;
    if (is_full())
    {
        cur_node.pre = cur_index;
        cur_node.next = cur_index;
        valid = cur_index;
    }
    else
    {
        cur_node.pre = linkedList[valid].pre;
        cur_node.next = valid;
        linkedList[linkedList[valid].pre].next = cur_index;
        linkedList[valid].pre = cur_index;
    }
}

int StrangeLinkedListForInt::get_value(iterator it)
{
    struct node cur = *it;
    return cur.value;
}

StrangeLinkedListForInt::iterator StrangeLinkedListForInt::get_next(iterator it)
{
    return ++it;
}

StrangeLinkedListForInt::iterator StrangeLinkedListForInt::get_previous(iterator it)
{
    return --it;
}

StrangeLinkedListForInt::iterator StrangeLinkedListForInt::begin()
{
    return iterator(linkedList, head);
}

StrangeLinkedListForInt::iterator StrangeLinkedListForInt::end()
{
    return iterator(linkedList, linkedList[head].pre);
}

bool StrangeLinkedListForInt::is_empty()
{
    if (-1 == head)
    {
        cout << "*** Error: Remove the empty linkedList" << endl;
        return true;
    }

    return false;
}

bool StrangeLinkedListForInt::is_full()
{
    if (-1 == valid)
    {
        cout << "*** Error: Insert the full linkedList" << endl;
        return true;
    }

    return false;
}

int main(void)
{
    class StrangeLinkedListForInt obj, read_obj;
    FILE * stream;

    cout << "sizeof(StrangeLinkedListForInt): " << sizeof(StrangeLinkedListForInt) << "  " << sizeof(obj) << endl;

    obj.insert_front(12);
    obj.insert_front(34);
    obj.insert_back(11);
    obj.insert_back(56);
    obj.insert_front(100);
    obj.insert_front(77);

    //obj.remove_front();
    //obj.remove_back();
    //obj.remove_back();

    StrangeLinkedListForInt::iterator tmp_it = obj.begin();
    for (StrangeLinkedListForInt::iterator it = obj.begin(); ; ++it)
    {
        cout << (*it).value << " ";

        if ((*it).value == 11)
            tmp_it = it;
        
        if (it == obj.end())
            break;
    }
    cout << endl;

    obj.remove(tmp_it);
    // obj.insert_after(55, tmp_it);
    
    //StrangeLinkedListForInt::iterator other_it = obj.get_previous(tmp_it);
    StrangeLinkedListForInt::iterator other_it = obj.get_next(tmp_it);
    cout << "get_value: " << obj.get_value(other_it) << endl;

    stream = fopen("class_file.txt", "wb");
    fwrite(&obj, sizeof(obj), 1, stream);
    fclose(stream);

    stream = fopen("class_file.txt", "rb");
    fread(&read_obj, sizeof(read_obj), 1, stream);
    fclose(stream);

    for (StrangeLinkedListForInt::iterator it = obj.begin(); ; ++it)
    {
        cout << (*it).value << " ";
        
        if (it == obj.end())
            break;
    }
    cout << endl;

    return 0;
}
