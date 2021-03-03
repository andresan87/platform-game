class DummyController : CharacterController
{
	void update() override
	{
	}

	float getMovementSpeed() const override
	{
		return 0.0f;
	}

	float getJumpImpulse() const override
	{
		return 0.0f;
	}
}
