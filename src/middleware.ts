// src/middleware.ts
import type { MiddlewareHandler } from 'astro';

export const onRequest: MiddlewareHandler = async (context, next) => {
  const { pathname } = context.url;

  // Only redirect if the user visits the root path "/"
  if (pathname === '/') {
    const langHeader = context.request.headers.get('accept-language');
    const preferredLang = langHeader?.startsWith('es') ? 'es' : 'en';

    return context.redirect(`/${preferredLang}`, 302);
  }

  return next();
};
