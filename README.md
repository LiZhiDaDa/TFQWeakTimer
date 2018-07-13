# TFQWeakTimer
让大家拿过来就能用且没有循环引用的```Timer```。
具体解释见文章[代理模式管理NSTimer解决循环引用](https://juejin.im/post/5b4824f06fb9a04fbf26fed2)

目前只支持在主线程运行循环方法，如果你有在其他线程运行方法的需求可以联系我，我再增加在子线程运行的方法。到时候就涉及到```NSRunloop```的知识了。

### TFQWeakTimer使用方法
1、将```TFQWeakTimer```文件拖到自己项目中。

2、导入```"TFQWeakTimer.h"```通过```initWithXXX```方法创建定时器.

3、在需要销毁```TFQWeakTimer```或者当前类```dealloc```的时候调用```TFQWeakTimer```中的对象方法```invalidateTimer```销毁```TFQWeakTimer```

### 期待：
有什么问题请Issues我，或者到掘金去给我评论，一定及时回复。

有什么想法也可以Pull requests，想法好一定同意commit
