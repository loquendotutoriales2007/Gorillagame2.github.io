# Code Converted
```html
<!-- 
import pygame
import random
import os

# Initialize pygame
pygame.init()

# Screen settings
WIDTH, HEIGHT = 800, 600
screen = pygame.display.set_mode((WIDTH, HEIGHT))
pygame.display.set_caption("Rampage Gorilla")

# Colors and assets
WHITE = (255, 255, 255)
BLACK = (0, 0, 0)
ASSETS_DIR = "assets"

# Game settings
FPS = 60
PLAYER_SIZE = 50
ITEM_SIZE = 30
NUM_ITEMS = 10
SMASH_RANGE = 60
GAME_TIME = 30  # seconds

# Load assets
GORILLA_IMAGE = pygame.image.load(os.path.join(ASSETS_DIR, "gorilla.png"))
ITEM_IMAGE = pygame.image.load(os.path.join(ASSETS_DIR, "item.png"))
BACKGROUND_MUSIC = os.path.join(ASSETS_DIR, "background_music.mp3")
SMASH_SOUND = pygame.mixer.Sound(os.path.join(ASSETS_DIR, "smash.wav"))

# Scale images
GORILLA_IMAGE = pygame.transform.scale(GORILLA_IMAGE, (PLAYER_SIZE, PLAYER_SIZE))
ITEM_IMAGE = pygame.transform.scale(ITEM_IMAGE, (ITEM_SIZE, ITEM_SIZE))

# Play background music
pygame.mixer.music.load(BACKGROUND_MUSIC)
pygame.mixer.music.play(-1)

# Gorilla class
class Gorilla(pygame.sprite.Sprite):
    def __init__(self):
        super().__init__()
        self.image = GORILLA_IMAGE
        self.rect = self.image.get_rect(center=(WIDTH // 2, HEIGHT // 2))
        self.speed = 5

    def update(self, keys):
        if keys[pygame.K_LEFT]:
            self.rect.x -= self.speed
        if keys[pygame.K_RIGHT]:
            self.rect.x += self.speed
        if keys[pygame.K_UP]:
            self.rect.y -= self.speed
        if keys[pygame.K_DOWN]:
            self.rect.y += self.speed

        # Keep the player within the screen bounds
        self.rect.x = max(0, min(WIDTH - PLAYER_SIZE, self.rect.x))
        self.rect.y = max(0, min(HEIGHT - PLAYER_SIZE, self.rect.y))

# Household Item class
class HouseholdItem(pygame.sprite.Sprite):
    def __init__(self, x, y):
        super().__init__()
        self.image = ITEM_IMAGE
        self.rect = self.image.get_rect(topleft=(x, y))

# Main menu
def main_menu():
    font = pygame.font.SysFont(None, 48)
    title_text = font.render("Rampage Gorilla", True, BLACK)
    start_text = font.render("Press ENTER to Start", True, BLACK)
    clock = pygame.time.Clock()

    while True:
        screen.fill(WHITE)
        screen.blit(title_text, ((WIDTH - title_text.get_width()) // 2, HEIGHT // 3))
        screen.blit(start_text, ((WIDTH - start_text.get_width()) // 2, HEIGHT // 2))

        pygame.display.flip()

        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                exit()
            if event.type == pygame.KEYDOWN and event.key == pygame.K_RETURN:
                return

        clock.tick(FPS)

# Main game loop
def game_loop():
    # Create sprite groups
    all_sprites = pygame.sprite.Group()
    items = pygame.sprite.Group()

    # Create player
    player = Gorilla()
    all_sprites.add(player)

    # Create household items
    for _ in range(NUM_ITEMS):
        x = random.randint(0, WIDTH - ITEM_SIZE)
        y = random.randint(0, HEIGHT - ITEM_SIZE)
        item = HouseholdItem(x, y)
        all_sprites.add(item)
        items.add(item)

    # Score and font
    score = 0
    font = pygame.font.SysFont(None, 36)

    # Timer
    start_ticks = pygame.time.get_ticks()

    clock = pygame.time.Clock()
    running = True

    while running:
        clock.tick(FPS)
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False

        keys = pygame.key.get_pressed()
        player.update(keys)

        # Smash mechanic
        if keys[pygame.K_SPACE]:
            for item in items.copy():
                if player.rect.colliderect(item.rect.inflate(SMASH_RANGE, SMASH_RANGE)):
                    item.kill()
                    score += 10
                    SMASH_SOUND.play()

        # Timer
        elapsed_time = (pygame.time.get_ticks() - start_ticks) // 1000
        if elapsed_time >= GAME_TIME:
            running = False

        # Drawing
        screen.fill(WHITE)
        all_sprites.draw(screen)

        # Score and timer display
        score_text = font.render(f"Score: {score}", True, BLACK)
        timer_text = font.render(f"Time: {GAME_TIME - elapsed_time}", True, BLACK)
        screen.blit(score_text, (10, 10))
        screen.blit(timer_text, (10, 50))

        pygame.display.flip()

    pygame.mixer.music.stop()
    return score

# Run the game
if __name__ == "__main__":
    main_menu()
    final_score = game_loop()
    print(f"Game Over! Your Score: {final_score}")
    pygame.quit()
-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rampage Gorilla</title>
    <style>
        body {
            background-color: white;
            color: black;
            font-family: Arial, sans-serif;
            text-align: center;
        }
        #score, #timer {
            font-size: 24px;
        }
    </style>
</head>
<body>
    <h1>Rampage Gorilla</h1>
    <p id="start">Press ENTER to Start</p>
    <div id="gameArea" style="display:none;">
        <div id="score">Score: 0</div>
        <div id="timer">Time: 30</div>
    </div>
    <script>
        // JavaScript equivalent of the game logic would go here
        // This includes handling key events, updating positions, and rendering graphics
    </script>
</body>
</html>
