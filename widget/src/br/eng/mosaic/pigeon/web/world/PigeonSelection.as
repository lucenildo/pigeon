package br.eng.mosaic.pigeon.web.world 
{
	import br.eng.mosaic.pigeon.web.entities.Cursor;
	import br.eng.mosaic.pigeon.web.entities.FacebookConfig;
	import br.eng.mosaic.pigeon.web.entities.PlayButton;
	import br.eng.mosaic.pigeon.web.entities.background.*;
	import br.eng.mosaic.pigeon.web.entities.background.selection.*;
	import br.eng.mosaic.pigeon.web.entities.background.transition.*;
	
	import com.facebook.graph.Facebook;
	
	import flash.text.TextField;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	import punk.ui.*;
	import punk.ui.skins.WhiteAfterlife;
	
	/**
	 * ...
	 * @author Kellyton Brito
	 */
	public class PigeonSelection extends World {
		
		public static var pontuacao:int = 0;
		var mensagem = "";
		var textoDoUsuario:Text;
		var userTextEntity:Entity ;
		public var cursor:Cursor=new Cursor;
		
		private var level:int;
		
		private var textArea:PunkTextArea;
		
		//public static var cursor:Cursor=new Cursor;
		
		[Embed(source = 'br/eng/mosaic/pigeon/web/assets/smb2-title.mp3')]
		private static const BKG_MUSIC:Class;
		public static var bkg_music = new Sfx(BKG_MUSIC);
		
		var go:Go;
		
		var sigeon:SigeonSelection;
		
		private function createBackground(){			
			add(new Bg());
			add(new BgSelection());
			//add(new OpeningScreen());
			//add(new PlayButton(FP.width/2, FP.height*2/3));
			
			var obj:Entity;
			obj = new UserMessage();
			obj.x = FP.width/2 - 165;
			obj.y = FP.height - 100; //obj.height;
			add(obj);
			 
			//add (new Points(250,30));
			//add (new Figeon(250, 120));
			
			//TODO ajeitar para aparecer bonitinho
			//add (new Back(272, 380));
			//add (new Separator(280 + 67, 380));
			
			//go = new Go(415, 380);
			//add(go);
			
			//TODO Ajeitar a posição para aparecer bonitinho
/*			add(new Avatar(450, 20));
			add(new Avatar(550, 20));
			add(new Avatar(650, 20));
			add(new Avatar(450, 150));
			add(new Avatar(550, 150)); */
			
			//add(new Star(210,10));
			
			add (new Help(635,420));
			
			add (new FacebookButton(20, FP.height * 1.8/3));
			add (new Twitter(20, FP.height * 1.8/3 + 70));
			add (new Pause(100, FP.height*1/2 + 240));
			
			
			sigeon = new SigeonSelection(100, 200);
			add(sigeon);
			//add (new SigeonSelection(100, 200));
			add (new FigeonSelection(290, 300));
			add (new FigeanSelection(500, 200));
			
			add(new PlayButton);
			
		}
		
		override public function begin():void 
		{
			createBackground();
			
			textArea = new PunkTextArea("<Put Message Here>", FP.width/2 - 150, FP.height - 65, 300, 65, new WhiteAfterlife);
			//textArea = new PunkTextArea("Cade a merda do texto, kct!?!?!?", 0, FP.height - 100, 300, 100);
			
			add(textArea); 
			
			// COlocar a musica de novo
			/*if (!bkg_music.playing){
			bkg_music.play(0.5, 1);
			}*/
			
			add(cursor);
			
			
			super.begin();
		}
		
		public function PigeonSelection() {
			super();
		}
		
		public function startGame():void{
			//FP.world = new MyWorld;
		}
		
		override public function update():void {
			super.update();
			
			if(Input.mousePressed && sigeon.collidePoint(sigeon.x, sigeon.y, Input.mouseX, Input.mouseY)){
				//TelaInicial(FP.world).startGame();
				// 1 é o Figeon, 2 é o Sigeon e 3 é o Figean 
				//FP.world = new Scenario1(1);
			}
			
			this.bringForward(cursor);
			
			super.update();
			
		}
		
	}
	
}