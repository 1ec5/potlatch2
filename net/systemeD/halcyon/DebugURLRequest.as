package net.systemeD.halcyon {

	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.system.Capabilities;
	import net.systemeD.halcyon.Globals;

    /**
    * If nocache has been set to 'true' via FlashVars, this will make the URLRequest using
    * POST rather than GET - thereby preventing FP from caching it.
    *
    * <p>Sadly we can't just subclass URLRequest, which is defined as final. So you need to create your
    * new DebugURLRequest, then refer to its .request property.</p>
    *
    * <p>We use an evil Global because we don't know where loaderInfo.parameters will be.</p>
    *
    * @see http://www.ultrashock.com/forums/actionscript/force-reload-files-only-using-as3-123408.html
    */

	public class DebugURLRequest {

		public var request:URLRequest;

		public function DebugURLRequest(url:String=null) {
			request=new URLRequest(url);
			if (Globals.vars.hasOwnProperty('nocache') && Globals.vars.nocache) {
				request.method=URLRequestMethod.POST;
				request.data=true;
			}
		}

	}

}
