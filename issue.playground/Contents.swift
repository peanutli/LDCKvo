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

/*
 *  物理层，链路层，网络层(ip)，传输层(tcp)，应用层（http）
 */


/*
 *
    长连接，短连接 , http ,tcp ,tcp/ip socket 心跳策略
 
    1.http 与 tcp/ip 协议之间关系
    2.http 与tcp /socket 之间连接
    3.长连接，短连接
    4.http 长连接，短连接 与 tcp 长连接，短连接区别
    5.手写一次tcp长连接
    6.心跳策略
 *
 *  2.1 http ,tcp ,socket 关系  http 应用层 tcp -> 传输层， （ http 包装数据，每次请求，都有响应 request ressponse,response结束，断掉链接）     （ tcp  传输数据 ,响应，三次握手）
     1.0 每次request 单独建立 连接  response 释放  短连接
     1.1 一次连接 多个request requests 可以重叠  ，不需要 等待一个请求结束，在发起下一个 。 这种叫 长连接。
        request-header keep-alive:true    response-header: connection: keep-alive
 
     2.2  tcp  手机联网  手机底层 实现了 tcp/ip 协议   手机终端  通过 无线网络  建立 tcp 连接
 
         tcp 可以对上层网络 提供接口  使上层网络的传输 建立在无差别的网络上
 
         tcp 连接 需要 三次握手 ，断开 需要 四次 握手
 
         建立连接  三次 握手  喂喂喂
         数据 传输 哈哈哈
         断开连接  四次 握手  喂 （喂喂） 喂
 
    2.3 socket 套接字  支持 tcp,ip 协议的基本单元
        网络通信过程中 断点的抽象表示
        socket 包含五种信息，连接使用的协议 ， 本地主机的ip地址，本地进程的协议端口，远程主机的ip地址，远地进程的协议端口
 
        套接字的连接过程：
        服务器监听， 客户端请求 ，连接确认
 
        等待连接的状态：
        客户端连接：描述需要连接的服务器的套接字关键字。  套接字的：地址和端口
        确认连接： 服务器套接字，监听到客户端套接字的请求，就响应客户端套接字的请求，
                建立一个新的进程，服务端套接字描述发给客户端，一旦客户端确认了描述，双方就正式建立了连接。
 
    socket 和 http 之间关系
 
        socket 长连接，跟服务器之间，能相互通信， 客户端和服务器之间需要穿过多个 结点  （路由，防火墙，网关）容易被终止，就断了。
 
        轮询连接：就是轮询告诉网络，目前还是处于可控制状态。 （心跳包）
 
 
    Http长连接和短链接、
     建立连接之后，得到响应之后，建立的连接不断开，下次在访问这个服务器上的内容，连接不是直接断开，
 
    手写一次tcp 长连接
 
 
    心跳策略：
 
    测试心跳   看结果   成功   失败    失败  继续测试 ，如果连续5次都失败
 
    测试心跳，用轮询的方式  每隔一段间隔 检测一下心跳 ，假设 间隔 是 5秒 。
 
    失败，要重新尝试建立 socket 连接
 
 
 
 *
 */


/**
 1. 物理层
 2. 链路层
 3. 网络层
 4. 传输层
 5. 应用层
 
 传输层是  端口 与 端口 的通信   就是 套接字 socket  udp  tcp  udp  ([header data] header: 发送port和接收port)   计算8个字节的总长度
 
 TCP协议： TCP 协议中的每个数据包，是否发送成功都会有确认。
 
 ***/

/**
 *  header     header   header   Data
    以太网标头   ip协议   端口协议   数据
    发一个包，需要两个 参数  发送方的mac地址，  对方的mac地址，对方的ip地址
 
    电脑A  网关A根据路由协议
 
    本机的IP地址
    子网掩码
    网关的IP地址
    DNS的IP地址
 
    动态分布 IP地址  自动分布IP地址g的协议叫DHCP 协议
 */

/*
 *什么是 First-class function？ 头等函数 头等公民
 
 函数可以作为别的函数的参数，返回值 赋值给变量或存储的数据结构中  ---- 函数类型的普通变量
 
 使用高阶函数

 map是一个高阶函数 ， 实是一个函数 和一个list  返回结果把参数的 函数作用于 list 每一个函数后的 结果形成 list
 
 
 结构化的程序设计 模块复用和访问控制，  Fist Class Function 的语言中 ，高阶函数 作为 之间的胶水，进一步方便了函数的复用、
 纯函数 ：
 
 纯函数 ，一等公民，没有副作用 ，无状态 ，常量，
 
 简单函数 add(a,b) 拓展开----->
 
 外部含量： C合去何从  换成函数，写成定量  都可以  好处是没有副作用
 
 无状态，小范围内使用
 
 输出决定于输入
 
 纯函数，不是纯函数
 
 纯函数 和 不是纯函数
 
 */


/**
 *__autoreleasing __autoreleasing
 */

/**
 *函数式编程的数据结构   不可变的数据结构，所以不能赋值
 
    图灵 ： 1.世界上是否所有的数学问题都有答案？ 2.是否可以通过有限的步骤，得到答案。 3.  是否有一种机械，让它不断运行，最终得到结果。
 
 
 */

/*
 * 命令式编程，面向对象编程，函数式编程
      命令式编程： 图灵机  一条写满数据的纸带 
 */
