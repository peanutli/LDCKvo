import Cocoa

var str = "这是一个测试数据😊😊"
//let count1 = str.lengthOfBytes(using: String.Encoding.utf8) //每个汉字占3个字节

for i in str.characters {
    print(i)
}

/**
 * sanguo：
        wei ： caocao dianwei xiaohouchun caiwenji lvbu diaochan simayi
        shu :  liubei zhugeliang huangzhong guanyu zhangfei zhaoyun
        wu  :  sunce daqiao xiaoqiao sunshangxiang zhouyu
    changcheng:
        huamulan , kai ,bailixuance ,bailishouyue,sulie
 
    mozi,bianque,
    niumo ,zhubajie ,sunwukong,
 */

/**
 *
 *如何自己高效实现NSUserDefault?
 
 
    //高效 存储这块  存储的数据类型：  缓存，硬盘
 
        缓存  存储类型   存储手段   读取  读取方式 ，读取手段   API设计  通过key存  通过key取  数据类型     oc的基本数据类型，注意一点是，(要存的是对象，不是对象的引用)
        硬盘
        全局
        分层
 
        即时写入，不即时写入问题
 
 
        存  把数据写入硬盘
        取  从数据从硬盘读出来
 
        Hash表 存着 key 和  对应 的value 值的地址， 找到地址，就可以读出来了。
               存   存的时候，把value 存起来， 找到地址 ，地址写到 key 对应的内存 上。
 
        Hash 表也存起来  ， 读的时候，还能把这个Hash表读出来 。读出来之后，就能够根据key 去查找，去保存。
 
        plist: 序列化
 
 */

