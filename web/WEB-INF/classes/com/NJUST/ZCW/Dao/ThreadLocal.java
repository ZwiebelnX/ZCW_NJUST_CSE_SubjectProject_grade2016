package com.NJUST.ZCW.Dao;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/*
本类用来避免在并发环境下引起不同线程对同一Session的竞争
 */
public class ThreadLocal {
    //HashMap存储ThreadLocal变量，并实现线程安全
    private Map values = Collections.synchronizedMap(new HashMap<>());
    public Object get(){
        Thread curThread = Thread.currentThread();
        Object obj = values.get(curThread);
        if(obj == null && !values.containsKey(curThread)){
            obj = initialValue();
            values.put(curThread, obj);
        }
        return obj;
    }

    public void set(Object newValue){
        values.put(Thread.currentThread(), newValue);
    }

    public Object initialValue(){
        return null;
    }
}
