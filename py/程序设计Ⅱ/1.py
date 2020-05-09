import pygame
import sys
from pygame.locals import *
from random import *

def main():
    pygame.init()

    #ball_image = "gray_ball.png"
    #bg_image = "background.png"

    running = True

    ##############################################################
    #添加背景音乐
    pygame.mixer.music.load('bg_music.ogg')
    pygame.mixer.music.set_volume(0.2)#设置音量    
    pygame.mixer.music.play()#播放
	#设置 暂停 标记
    #pause = False
#显示播放和暂停图片
    #pause_image = pygame.image.load("pause.png").convert_alpha()
    #unpause_image = pygame.image.load("unpause.png").convert_alpha()
    #pause_rect = pause_image.get_rect()
    #pause_rect.left, pause_rect.top = (width - pause_rect.width) // 2,  (height - #pause_rect.height) // 2#居窗口正中央

	while running:

        pygame.display.flip()
        clock.tick(30)
		
if __name__ == "__main__":
    main()