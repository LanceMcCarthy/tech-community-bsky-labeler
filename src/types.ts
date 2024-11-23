import { LabelValueDefinitionStrings } from '@atproto/api/dist/client/types/com/atproto/label/defs.js';

export interface Label {
  rkey: string;
  identifier: string;
  locales: LabelValueDefinitionStrings[];
  // Docs https://docs.bsky.app/docs/advanced-guides/moderation#label-values
  // severity: string;
  // blurs: string;
  // defaultSetting: string;
}
