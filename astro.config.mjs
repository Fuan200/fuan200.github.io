import { defineConfig } from 'astro/config';

// https://astro.build/config
export default defineConfig({
    site: 'https://fuan200.github.io/',
    i18n: {
        defaultLocale: 'es',
        locales: [ 'es', 'en' ],
        routing: {
            prefixDefaultLocale: false,
        }
    }
});
