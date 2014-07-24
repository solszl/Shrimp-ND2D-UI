package com.shrimp.nd2d.parsers
{
	import com.shrimp.nd2d.assets.AssetLoader;
	import com.shrimp.nd2d.assets.AssetNullData;
	import com.shrimp.nd2d.assets.AssetParser;
	import com.shrimp.nd2d.constant.AssetType;
	
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	
	/**
	 * ...
	 * @author mm
	 */
	public class JUIBinaryParser extends AssetParser
	{
		public function JUIBinaryParser() 
		{
			super();
		}
		
		protected override function dispose():void
		{
			m_loader.close();
			m_loader = null;
		}		
		
		protected override function parseData():void
		{
			m_loader = new URLLoader();
			m_loader.dataFormat = URLLoaderDataFormat.BINARY;
			m_loader.addEventListener(Event.COMPLETE, loadComplete);
			m_loader.load(new URLRequest(info.url));
		}
		
		private function loadComplete(p_event:Event):void
		{
			var l_bytes:ByteArray = p_event.target.data;
			l_bytes.uncompress();
			var l_data:Object = l_bytes.readObject();
			var l_loader:AssetLoader = new AssetLoader();
			for (var l_name:String in l_data)
			{
				l_loader.loadData(new JUIAssetData(l_data[l_name]), l_name, AssetType.OBJECT, info.level, info.lifecycle);
			}
			l_loader.destroy();
			l_bytes.clear();
			
			parseDone(new AssetNullData());
		}		
		
		private var m_loader:URLLoader = null;
		
		public static function support(p_type:int):Boolean
		{
			if (AssetType.BINARY_UI == p_type)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
	}
}
import com.shrimp.nd2d.assets.IAssetData;



class JUIAssetData implements IAssetData
{
	public function JUIAssetData(p_data:Object)
	{
		m_data = p_data;
	}
	
	public function get data():*
	{
		return m_data;
	}
	
	public function destroy():void
	{
		m_data = null;
	}
	
	private var m_data:Object = null;
}