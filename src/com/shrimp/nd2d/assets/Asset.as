package com.shrimp.nd2d.assets
{
	/**
	 * 
	 * @author Sol
	 * 
	 */	
	internal class Asset 
	{
		private static const INVALID:String		= "INVALID";
		private static const PROGRESS:String	= "PROGRESS";
		private static const COMPLETE:String	= "COMPLETE";
		
		public function Asset(url:String, type:int, level:int) 
		{
			_id = assetId(url, type);
			_url = url;
			_type = type;
			_level = level;
		}
		
		internal function get id():String
		{
			return _id;
		}
		
		internal function get url():String
		{
			return _url;
		}
		
		internal function get type():int
		{
			return _type;
		}
		
		internal function get level():int
		{
			return _level;
		}
		
		internal function get data():*
		{
			return _data.data;
		}
		
		internal function retain():void
		{
			_life = _lifecycle;
			++_ref;
		}
		
		internal function release():void
		{
			--_ref;
		}
		
		internal function get ref():int
		{
			return _ref;
		}
		
		internal function set lifecycle(p_lifecycle:int):void
		{
			_life = _lifecycle = Math.max(_lifecycle, p_lifecycle);
		}
		
		internal function get lifecycle():int
		{
			return _lifecycle;
		}
		
		internal function set life(p_life:int):void
		{
			_life = p_life
		}
		
		internal function get life():int
		{
			return _life;
		}
		
		internal function destroy():void
		{
			if (_parser)
			{
				_parser._destroy();
				_parser = null;
			}
			
			if (_data)
			{
				_data.destroy();
				_data = null;
			}
		}
		
		internal function request(p_callback:Function):void
		{
			if (COMPLETE == _state)
			{
				if (null != p_callback)
				{
					p_callback(this);
				}
				
				return;
			}
			
			if (null != p_callback)
			{
				_callbacks.push(p_callback);
			}
			
			if (PROGRESS == _state)
			{
				return;
			}
			
			var l_parsers:Vector.<Class> = AssetParser._parsers;
			for (var i:int = 0; i < l_parsers.length; ++i)
			{
				if (Object(l_parsers[i]).support(_type))
				{
					_state = PROGRESS;
					_parser = new l_parsers[i]();
					_parser._parse(new AssetInfo(this), done);
					break;
				}
			}
		}
		
		internal function done(p_data:IAssetData):void
		{
			_data = p_data;
			_state = COMPLETE;
			
			for (var i:int = 0; i < _callbacks.length; ++i)
			{
				_callbacks[i](this);
			}
			_callbacks.length = 0;
		}
		
		private var _id:String = "undefined";
		private var _url:String = null;
		private var _type:int = -1;
		private var _data:IAssetData = null;
		private var _state:String = INVALID;
		private var _callbacks:Vector.<Function> = new Vector.<Function>;
		private var _parser:AssetParser = null;
		private var _level:int = 0;
		private var _ref:int = 0;
		private var _life:int = 0;
		private var _lifecycle:int = 0;
		
		internal static function assetId(uri:String, assetType:int):String
		{
			return uri + "@" + assetType;
		}
	}
}