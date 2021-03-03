class GameScene : Scene
{
	private Button@ m_exitButton;
	
	private Character@ m_character;

	private CharactersManager m_charactersManager;
	private CameraController@ m_cameraController;
	
	GameScene()
	{
		const string sceneName = "scenes/platforms.esc";
		super(sceneName);
	}

	void onCreated() override
	{
		@m_exitButton = Button("sprites/return_button.png", vector2(0.0f, 0.0f), vector2(0.0f, 0.0f));

		const vector2 screenMiddle(GetScreenSize() * 0.5f);

		AddEntity("background.ent", vector3(screenMiddle, -10.0f));

		@m_character = Character("witch.ent", screenMiddle);
		m_character.setController(MainCharacterController());
		
		@m_cameraController = CharacterCameraController(@m_character);
		
		Character npcFollower("flameDragon.ent", vector2(screenMiddle.x - 100.0f, screenMiddle.y));
		npcFollower.setController(NPCFollowPlayerController(@npcFollower, @m_character));

		m_charactersManager.addCharacter(@m_character);
		m_charactersManager.addCharacter(@npcFollower);
	}

	void onUpdate() override
	{
		m_charactersManager.update();
		m_cameraController.update();

		m_exitButton.putButton();
		if (m_exitButton.isPressed())
		{
			g_sceneManager.setCurrentScene(MainMenuScene());
		}
	}
}
