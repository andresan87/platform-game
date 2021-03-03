class CharactersManager
{
	private Character@[] m_characters;

	void addCharacter(Character@ newCharacter)
	{
		m_characters.insertLast(@newCharacter);
	}

	void update()
	{
		for (uint t = 0; t < m_characters.length(); t++)
		{
			m_characters[t].update();
		}
	}
}
