package restx;

import haxe.Constraints.Function;
import js.node.http.Method;
using thx.core.Nulls;

class Router {
  var server : Dynamic;
  public function new(server : Dynamic) {
    this.server = server;
  }

  public function registerMethod(path : String, method : Method, process : RouteProcess<IRoute, {}>) {
    if(null == method)
      method = Get;

    Reflect.callMethod(
      server,
      Reflect.field(server, (method : String).toLowerCase()), [
        path,
        process.run
      ]
    );
  }
}