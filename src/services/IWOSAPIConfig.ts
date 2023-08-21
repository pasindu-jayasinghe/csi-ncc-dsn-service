import { Injectable } from "@nestjs/common";

/**
 * Configuration class needed in base class.
 * The config is provided to the API client at initialization time.
 * API clients inherit from #AuthorizedApiBase and provide the config.
 */
@Injectable()
export class IWOSAPIConfig {
    /**
     * Returns a valid value for the Authorization header.
     * Used to dynamically inject the current auth header.
     */
    getAuthorization: () => 'yXLn2ujVplE4FwukJ1p62UvS9ILVEAda1kWR0xAg';
  }