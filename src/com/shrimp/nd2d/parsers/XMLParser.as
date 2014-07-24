package com.shrimp.nd2d.parsers
{
	import com.shrimp.nd2d.assets.AssetParser;
	import com.shrimp.nd2d.constant.AssetType;
	
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	public class XMLParser extends AssetParser
	{
		public function XMLParser() 
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
			parseDone(new XMLAssetData(XML(p_event.target.data)));
		}
		
		private var m_loader:URLLoader = null;
		
		public static function support(p_type:int):Boolean
		{
			if (AssetType.XML == p_type)
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



class XMLAssetData implements IAssetData
{
	public function XMLAssetData(p_data:XML)
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
	
	private var m_data:XML = null;
}