export class modifier_example_bonus extends BaseModifier {
  IsHidden(): boolean {
    return false;
  }

  DeclareFunctions(): modifierfunction[] {
    return [modifierfunction.MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT];
  }

  GetModifierMoveSpeedBonus_Constant(): number {
    return this.GetAbility()?.GetSpecialValueFor("bonus_speed") ?? 0;
  }
}
