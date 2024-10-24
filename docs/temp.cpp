#include <iostream>
#include <thread>

// 线程函数
void threadFunction(int threadID) {
    std::cout << "Thread " << threadID << " is running." << std::endl;
}

int main() {
    // 创建线程
    std::thread t1(threadFunction, 1);
    std::thread t2(threadFunction, 2);

    // 等待线程完成
    t1.join();
    t2.join();

    std::cout << "Threads have finished execution." << std::endl;
    return 0;
}