# KKObjcProject
#### 关联对象

分类添加属性：

.h文件添加set,get方法的声明, .m文件不会添加成员变量,不会添加set,get方法实现

使用运行时实现给分类动态绑定属性

```objective-c
@interface KKPerson (Test1)
@property(nonatomic,assign) int weight;
@end

const void * kweightKey = &kweightKey;
- (void)setWeight:(int)weight{
    objc_setAssociatedObject(self, kweightKey, @(weight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (int)weight{
    int weight_ = [objc_getAssociatedObject(self, kweightKey) intValue];
    return weight_;
}
```

运行时关联对象对应修饰符

| objc_AssociationPolicy            | 对应的修饰符      |
| --------------------------------- | ----------------- |
| OBJC_ASSOCIATION_ASSIGN           | assign            |
| OBJC_ASSOCIATION_RETAIN_NONATOMIC | strong, nonatomic |
| OBJC_ASSOCIATION_COPY_NONATOMIC   | copy, nonatomic   |
| OBJC_ASSOCIATION_RETAIN           | strong, atomic    |
| OBJC_ASSOCIATION_COPY             | copy, atomic      |
