/**
 * Author: zed
 * Date: 2020/4/22 19:38
 * Description:
 */
//订阅者回调签名
typedef void GuideCallback<T extends Guide>(arg);

enum Guide{
  DEFAULT
}

class GuidePressListener<T extends Guide>{
  List<T> actions;

  GuidePressListener(){
    actions = [];
  }

  void register(T action){
    if(!actions.contains(action))
      actions.add(action);
  }

  void listener(GuideCallback<T> callback){
    actions.forEach((item)=>{
      callback(item)
    });
  }
}