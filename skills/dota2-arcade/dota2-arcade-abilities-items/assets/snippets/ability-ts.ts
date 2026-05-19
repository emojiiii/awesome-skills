export class example_ability extends BaseAbility {
  GetCooldown(level: number): number {
    return this.GetSpecialValueFor("cooldown");
  }

  OnSpellStart(): void {
    const caster = this.GetCaster();
    const target = this.GetCursorTarget();

    if (!target) {
      return;
    }

    ApplyDamage({
      victim: target,
      attacker: caster,
      damage: this.GetSpecialValueFor("damage"),
      damage_type: DAMAGE_TYPES.DAMAGE_TYPE_MAGICAL,
      ability: this,
    });
  }
}
