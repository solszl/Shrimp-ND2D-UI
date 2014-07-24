package com.shrimp.nd2d.parsers
{
	import com.shrimp.nd2d.assets.AssetParser;
	import com.shrimp.nd2d.constant.AssetType;
	
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author mm
	 */
	public class JSONParser extends AssetParser
	{
		public function JSONParser() 
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
			m_loader.addEventListener(Event.COMPLETE, loadComplete);
			m_loader.load(new URLRequest(info.url));
		}
		
		private function loadComplete(p_event:Event):void
		{
			parseDone(new JSONAssetData(JSON.parse(p_event.target.data)));
		}
		
		private var m_loader:URLLoader = null;
		
		public static function support(p_type:int):Boolean
		{
			if (AssetType.OBJECT == p_type)
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



class JSONAssetData implements IAssetData
{
	public function JSONAssetData(p_data:Object)
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