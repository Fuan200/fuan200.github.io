import { glob } from 'astro/loaders';
import { defineCollection } from 'astro:content';
import { z } from 'astro/zod';

const blog = defineCollection({
    loader: glob({ base: './src/content/blog', pattern: '**/*.md' }),
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
