# Color Architecture Refactor - Task List

## Phase 1: Foundation - Extend ColorTokens with All Semantic Roles

- [x] Task 1: Add status color roles to ColorTokens (success, warning, info + containers/on-colors)
- [x] Task 2: Add text color roles to ColorTokens (primary, secondary, tertiary, disabled, link, accent, status-specific)
- [x] Task 3: Add background color roles to ColorTokens (primary, surface, subtle, status-specific, disabled)
- [x] Task 4: Add border color roles to ColorTokens (default, subtle, disabled, primary, status-specific)
- [x] Task 5: Add button state color roles to ColorTokens (primary/secondary/tertiary/destructive states)
- [x] Task 6: Add text field state color roles to ColorTokens (background, border focused/error/success, hint, cursor, label, helper)
- [x] Task 7: Add icon color roles to ColorTokens (primary, secondary, disabled, on-primary, status-specific)
- [x] Task 8: Add utility color roles to ColorTokens (divider, overlay, navigationBarShadow)
- [x] Task 9: Update LightColorTokens.fromBrand() to generate all new roles from brand colors
- [x] Task 10: Update DarkColorTokens.fromBrand() to generate all new roles from brand colors

## Checkpoint: ColorTokens Complete
- [x] All 140+ semantic roles compile in ColorTokens
- [x] Light/dark factories generate all roles correctly
- [x] analyzer passes on tokens package (errors fixed, only info-level warnings remain)

## Phase 2: Update DesignTokens Theme Generation

- [x] Task 11: Update DesignTokens.light() to use enhanced ColorTokens
- [x] Task 12: Update DesignTokens.dark() to use enhanced ColorTokens
- [x] Task 13: Ensure ThemeData includes ColorTokens as ThemeExtension

## Checkpoint: Theme Generation Works
- [x] DesignTokens.light()/dark() produce valid ThemeData
- [x] ColorTokens accessible via Theme.of(context).extension<ColorTokens>()
- [x] Both light and dark themes render in widgetbook

## Phase 3: Migrate Atoms Package

- [ ] Task 14: Update DSButton to use ColorTokens semantic roles
- [ ] Task 15: Update DSIconButton to use ColorTokens semantic roles
- [ ] Task 16: Update DSCard to use ColorTokens semantic roles
- [ ] Task 17: Update DSInput to use ColorTokens semantic roles
- [ ] Task 18: Update DSBadge to use ColorTokens semantic roles
- [ ] Task 19: Update DSAvatar to use ColorTokens semantic roles
- [ ] Task 20: Update DSCheckbox to use ColorTokens semantic roles
- [ ] Task 21: Update DSRadio to use ColorTokens semantic roles
- [ ] Task 22: Update DSText to use ColorTokens semantic roles

## Checkpoint: Atoms Migrated
- [ ] All atom tests pass
- [ ] Widgetbook atom stories render in light/dark

## Phase 4: Migrate Molecules Package

- [ ] Task 23: Update molecule components to use ColorTokens
- [ ] Task 24: Update select, snackbar, tiles, avatar compositions

## Checkpoint: Molecules Migrated
- [ ] All molecule tests pass
- [ ] Widgetbook molecule stories render in light/dark

## Phase 5: Migrate Organisms Package

- [ ] Task 25: Update DSAppBar to use ColorTokens
- [ ] Task 26: Update DSBottomSheet to use ColorTokens
- [ ] Task 27: Update DSDialog to use ColorTokens

## Checkpoint: Organisms Migrated
- [ ] All organism tests pass
- [ ] Widgetbook organism stories render in light/dark

## Phase 6: Remove DsColors and Clean Up

- [ ] Task 28: Delete packages/tokens/lib/src/ds_colors.dart
- [ ] Task 29: Remove DsColors export from tokens barrel
- [ ] Task 30: Remove DsColors import from any remaining files
- [ ] Task 31: Update tokens package barrel to export only ColorTokens/BaseColors
- [ ] Task 32: Verify no imports of DsColors remain in codebase

## Checkpoint: DsColors Removed
- [ ] analyzer passes on entire workspace
- [ ] No DsColors references anywhere

## Phase 7: Widgetbook and Documentation

- [ ] Task 33: Add ColorTokens showcase story showing all semantic roles
- [ ] Task 34: Add theme customization story (brand color override)
- [ ] Task 35: Verify all existing widgetbook stories work in light/dark

## Checkpoint: Complete
- [ ] All tests pass: `fvm flutter test`
- [ ] Analyzer clean: `fvm flutter analyze`
- [ ] Widgetbook runs in Chrome with both themes
- [ ] Design system consumable via `DesignTokens.light/dark()`