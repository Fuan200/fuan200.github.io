import { defineCollection, z } from 'astro:content';

const blog = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    description: z.string().optional(),
    pubDate: z.date(),
    updatedDate: z.date().optional(),
    tags: z.array(z.string()).optional(),
    heroImage: z.string().optional(),
    lang: z.enum(['en', 'es']).default('en'),
  }),
});

export const collections = { blog };
