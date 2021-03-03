class NPCFollowPlayerController : CharacterController
{

	private float m_movementSpeed = 0.0f;
	private float m_jumpImpulse = 0.0f;

	private Character@ m_character;
	private Character@ m_npcCharacter;
	
	vector2 m_followedCharacterPos;
	vector2 m_npcCharacterPos;
	
	private bool m_touchingSinglePiece = false;
		
	NPCFollowPlayerController(Character@ npcCharacter, Character@ characterFollowed)
	{
		@m_npcCharacter = npcCharacter;
		@m_character = characterFollowed;
	}

	void update() override
	{
		m_followedCharacterPos = m_character.getPosition();
		m_npcCharacterPos = m_npcCharacter.getPosition();

		m_movementSpeed = 0.0f;
		m_jumpImpulse = 0.0f;

		const float npcSpeed = 4.0f;
		const float jumpImpulse = 9.0f;

		// find current move direction based on character's movement
		if (m_followedCharacterPos.x > m_npcCharacterPos.x + 70.f)
			m_movementSpeed = npcSpeed;
			
		if (m_followedCharacterPos.x < m_npcCharacterPos.x - 70.f)
			m_movementSpeed = -npcSpeed;
	}

	float getMovementSpeed() const
	{
		return m_movementSpeed;
	}

	float getJumpImpulse() const
	{
		return m_jumpImpulse;
	}	
}
